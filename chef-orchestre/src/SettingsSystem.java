/*
 * Ce projet est développé par les élèves ingénieurs :
 *      - Ayoub KHOUYA      -     a.khouya.ing@gmail.com
 *      - Hamza HRAMCHI      -     hramchi.hamza@gmail.com
 *      - Yahya MOUSAOUI      -     yahyamoussaoui2014@gmail.com
 * Copyright (c) 2020.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SettingsSystem {
    /**
     * @description: la class qui contient la configuration de systéme
     * */

    // lien ver la base de données pour les requets
    private static final String url = "jdbc:mysql://localhost:3306/mobilitypush?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC";

    // information de connexion à la base des données
    public static final String hostname = "localhost";
    public static final int port = 3306;

    public static final String username = "root";
    public static final String password = "";

    // des requetes utilisées
    public static final String sqlSelectNotifications = "SELECT mno_idnotification, mno_type, mno_cible FROM mb_notifications WHERE mno_etat = 0";
    public static final String sqlSelectFromEnvoieToNotify = "SELECT men_iduser FROM mb_envoie WHERE men_etatenvoie = 0";

    // lien de connexion avec le serveur node JS
    public static final String urlServeurTransit = "http://localhost:3000/api/notification/send-notification-to-user";

    // durées de consultation pour les threads !
    public static final int timeOfConsultation = 60000; // milliseconds 5 min
    public static final int timeOfNotification = 60000; // milliseconds 5 min


    // fonction connexion vers la base de données
    public static Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(SettingsSystem.url, SettingsSystem.username, SettingsSystem.password);
        } catch (SQLException ignored) { }
        return connection;
    }


}
