
import java.sql.*;
import java.time.LocalDate;

public class ThreadConsulation extends Thread {
    /**
     * @description: le thread qui consulte la base de données pour traiter les notifications crées.
     *              => ajouter les notification vers la table envoie.
     * */

    private static final boolean running = true;

    @Override
    public void run() {
        while (ThreadConsulation.running) {
            Thread.onSpinWait();
            try {
                try {
                    Connection connection = SettingsSystem.getConnection();
                    assert connection != null;
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery(SettingsSystem.sqlSelectNotifications);
                    while (resultSet.next()) {
                        envoieNotifications((id, cible, date) -> {
                                    try {
                                        Connection conn = SettingsSystem.getConnection();
                                        String sql = "INSERT INTO mb_envoie (men_iduser, men_idnotification, mav_datecreat) VALUES (\"" + cible + "\", \""+ id + "\", '" + date + "')";
                                        Statement statementcb = conn.createStatement();
                                        statementcb.executeUpdate(sql);
                                        sql = "UPDATE  mb_notifications SET mno_etat = 1 WHERE mno_idnotification = \"" + id + "\"";
                                        statementcb.executeUpdate(sql);
                                        statementcb.close();
                                        conn.close();
                                    } catch (SQLException ignored) {}
                        },
                                resultSet.getInt("mno_idnotification"),
                                resultSet.getInt("mno_cible"));
                    }
                    statement.close();
                    connection.close();
                } catch (Exception e) {
                    e.getMessage();
                    System.out.println("Connexion echouée à la base de données ");
                }
                Thread.sleep(SettingsSystem.timeOfConsultation);
            } catch (InterruptedException e) {
                e.printStackTrace();
                this.run();
            }
        }
    }

    private interface Callback {
        void callback(int id, int cible, String date);
    }

    private void envoieNotifications(Callback notification, int id, int cible) {
        String date = LocalDate.now().toString();
        notification.callback(id, cible, date);
    }

}
