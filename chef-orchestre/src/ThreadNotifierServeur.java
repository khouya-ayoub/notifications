
/*
 * Ce projet est développé par les élèves ingénieurs :
 *      - Ayoub KHOUYA      -     a.khouya.ing@gmail.com
 *      - Hamza HRAMCHI      -     hramchi.hamza@gmail.com
 *      - Yahya MOUSAOUI      -     yahyamoussaoui2014@gmail.com
 * Copyright (c) 2020.
 */

import org.json.JSONObject;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.*;
import java.time.Duration;


public class ThreadNotifierServeur extends Thread {
    /**
     * @description: thread qui se charge de notifier le serveur de transit pour envoyer les notification non envoyés
     * */

    private static final boolean running = true;

    @Override
    public void run() {
        while (ThreadNotifierServeur.running){
            Thread.onSpinWait();
            try{
                try {
                    Connection connection = SettingsSystem.getConnection();
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery(SettingsSystem.sqlSelectFromEnvoieToNotify);
                    while(resultSet.next()){
                        new ThreadNotifier(resultSet.getInt("men_iduser")).start();
                    }
                }catch(Exception e){
                    e.getMessage();
                    System.out.println("Connexion echouée à la base de données ");
                }
                Thread.sleep(SettingsSystem.timeOfNotification);
            } catch (InterruptedException e) {
                e.getMessage();
                this.run();
            }
        }
    }

    private static class ThreadNotifier extends Thread {
        private final int cible;
        public ThreadNotifier(int cible){
            this.cible = cible;
        }
        @Override
        public void run() {
            HttpClient client = HttpClient.newBuilder()
                    .connectTimeout(Duration.ofSeconds(20))
                    .build();
            HttpRequest requestPost = HttpRequest.newBuilder()
                    .uri(URI.create(SettingsSystem.urlServeurTransit))
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(new JSONObject("{ cible : " + this.cible + "  }").toString()))
                    .build();
            client.sendAsync(requestPost, HttpResponse.BodyHandlers.ofString())
                    .thenAccept(response -> {});

        }

    }

}
