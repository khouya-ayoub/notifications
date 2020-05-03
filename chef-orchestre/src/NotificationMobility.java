/*
 * Ce projet est développé par les élèves ingénieurs :
 *      - Ayoub KHOUYA      -     a.khouya.ing@gmail.com
 *      - Hamza HRAMCHI      -     hramchi.hamza@gmail.com
 *      - Yahya MOUSAOUI      -     yahyamoussaoui2014@gmail.com
 * Copyright (c) 2020.
 */

import java.time.LocalDate;

public class NotificationMobility {
    /**
     * @description: cette class représente une notification
     * */

    private final String titre;
    private final String description;
    private final String create;
    private final int cible;
    private final int type;
    private final LocalDate date;

    public NotificationMobility(String titre, String description, int type, int cible) {
        this.titre = titre;
        this.description = description;
        this.type = type;
        this.cible = cible;
        this.create = "SYSTEM NOTIFICATION";
        this.date = LocalDate.now();
    }

    public String getTitre() {
        return titre;
    }

    public String getDescription() {
        return description;
    }

    public int getCible() {
        return cible;
    }

    public int getType() { return type; }

    public LocalDate getDate() {
        return date;
    }

    public String getCreate() {
        return create;
    }

}
