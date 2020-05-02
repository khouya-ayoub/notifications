import { Component, OnInit } from '@angular/core';
import {AuthService} from "../services/auth.service";
import {Router} from "@angular/router";
import {NotificationService} from "../services/notification.service";

@Component({
  selector: 'app-list-notifications',
  templateUrl: './list-notifications.component.html',
  styleUrls: ['./list-notifications.component.scss']
})
export class ListNotificationsComponent implements OnInit {

  listnotif = [];

  constructor(private auth: AuthService,
              private notif: NotificationService,
              private router: Router) { }

  ngOnInit(): void {
    this.notif.getNotification().then();
  }

  logout() {
    this.auth.logout();
    this.router.navigate(['login']);
  }

  retour() {
    this.router.navigate(['dashboard']);
  }
}
