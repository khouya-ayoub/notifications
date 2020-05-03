/*
 * Ce projet est développé par les élèves ingénieurs :
 *      - Ayoub KHOUYA      -     a.khouya.ing@gmail.com
 *      - Hamza HRAMCHI      -     hramchi.hamza@gmail.com
 *      - Yahya MOUSAOUI      -     yahyamoussaoui2014@gmail.com
 * Copyright (c) 2020.
 */

import com.github.shyiko.mysql.binlog.BinaryLogClient;
import com.github.shyiko.mysql.binlog.event.*;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class ThreadEcouteDataBase extends Thread {
    /**
     * @description: thread qui se charge d'écouter tous les changements efféctuer dans la base de données
     * vous pouver le modifier.
     * */

    // constant pour ignorer qlq tables (voir thread initialisation système)!
    final Map<String, Long> ignoredTables = new HashMap<>();

    @Override
    public void run() {
        BinaryLogClient client
                = new BinaryLogClient(SettingsSystem.hostname, SettingsSystem.port, SettingsSystem.username, SettingsSystem.password);
        client.registerEventListener(event -> {
            EventData data = event.getData();


            if (data instanceof TableMapEventData) {
                if (((TableMapEventData)data).getTable().equals("mb_notifications"))
                    ignoredTables.put(((TableMapEventData)data).getTable(), ((TableMapEventData)data).getTableId());
                if (((TableMapEventData)data).getTable().equals("mb_envoie"))
                    ignoredTables.put(((TableMapEventData)data).getTable(), ((TableMapEventData)data).getTableId());
            }

            if (data instanceof WriteRowsEventData) {
                WriteRowsEventData insert = (WriteRowsEventData) data;
                try {
                    if ((insert.getTableId() != ignoredTables.get("mb_notifications")) && (insert.getTableId() != ignoredTables.get("mb_envoie"))) {
                        for (Object[] row : insert.getRows()) {
                            new ThreadCreationNotification(new NotificationMobility(
                                    "INSERTION",
                                    "Insertion dans la base de données !",
                                    0,
                                    2))
                                    .start();
                        }
                    }
                } catch (NullPointerException ignored) {}
            } else if (data instanceof UpdateRowsEventData) {
                UpdateRowsEventData update = (UpdateRowsEventData) data;
                try {
                    if ((update.getTableId() != ignoredTables.get("mb_notifications")) && (update.getTableId() != ignoredTables.get("mb_envoie"))) {
                        for (Map.Entry<Serializable[], Serializable[]> row : update.getRows()) {
                            new ThreadCreationNotification(new NotificationMobility(
                                    "MODIFICATION",
                                    "Modification dans la base de données !",
                                    0,
                                    4))
                                    .start();
                        }
                    }
                } catch (NullPointerException ignored) {}
            } else if (data instanceof DeleteRowsEventData) {
                DeleteRowsEventData delete = (DeleteRowsEventData) data;
                try {
                    if ((delete.getTableId() != ignoredTables.get("mb_notifications")) && (delete.getTableId() != ignoredTables.get("mb_envoie"))) {
                        for (Object[] row : delete.getRows()) {
                            new ThreadCreationNotification(new NotificationMobility(
                                    "SUPPRESSION",
                                    "Suppression dans la base de données !",
                                    2,
                                    3))
                                    .start();
                        }
                    }
                } catch (NullPointerException ignored) {}
            }
        });
        try {
            client.connect();
        } catch (Exception ignored) {}
    }
}
