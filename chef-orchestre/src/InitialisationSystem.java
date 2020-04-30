import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class InitialisationSystem extends Thread {
    /**
     * @description: Cette class permit l'initialison du thread qui écoute les changement dans la base de données.
     * Insertion, Modification et suppression.
     * Cette initialisation sert à identifier les deux tables mb_notifications et mb_envoie par le thread
     * pour éviter les problémes d'insertion illimités !
     * */

    @Override
    public void run() {
        try {
            Thread.sleep(10000);
            String sqlTableNotification = "INSERT INTO mb_notifications (MNO_IDNOTIFICATION, MNO_TITRE, MNO_DESCRIPTION, MNO_QUICREAT, MNO_DATECREAT) VALUES ('1', 'INITIALISATION SYSTEM', 'INITIALISATION SYSTEM', 'SYSTEM NOTIFICATION','2020-04-16')";
            String sqlTableEnvoie = "INSERT INTO mb_envoie (MEN_IDUSER, MEN_IDNOTIFICATION, MAV_DATECREAT) VALUES ('2', '1', '2020-04-23 00:00:00')";
            Connection connection = SettingsSystem.getConnection();
            Statement statement = connection.createStatement();
            statement.execute(sqlTableNotification);
            statement.execute(sqlTableEnvoie);
            statement.close();
            connection.close();
        } catch (SQLException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
