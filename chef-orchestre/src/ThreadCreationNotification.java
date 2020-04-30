
import java.sql.*;

public class ThreadCreationNotification extends Thread {
    /**
     * @description: thread qui se charge de créer une nouvelle notification et l'inserer dans la table ntification
     * sans bloquer le thréade de consultation
     * */

    private final NotificationMobility notificationMobility;

    public ThreadCreationNotification( NotificationMobility notificationMobility) {
        this.notificationMobility = notificationMobility;
    }

    @Override
    public void run() {

        try {
            String sql = "INSERT INTO mb_notifications(mno_titre, mno_description, mno_type, mno_cible, mno_quicreat, mno_datecreat)" +
                         " VALUES(\""+ notificationMobility.getTitre() +"\", \"" +
                                       notificationMobility.getDescription() + "\",\"" +
                                       notificationMobility.getType() + "\",\"" +
                                       notificationMobility.getCible() + "\",\"" +
                                       notificationMobility.getCreate() + "\",\"" +
                                       notificationMobility.getDate().toString() + "\")";
            Connection connection = SettingsSystem.getConnection();
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
            statement.close();
            connection.close();

        } catch (Exception ignored) { }
    }

}
