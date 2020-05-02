import { Component, OnInit } from '@angular/core';
import {AuthService} from '../services/auth.service';
import {Router} from '@angular/router';
import {NotificationService} from '../services/notification.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {

  private publicKey = 'BJthRQ5myDgc7OSXzPCMftGw-n16F7zQBEN7EUD6XxcfTTvrLGWSIG7y_JxiWtVlCFua0S8MTB5rPziBqNx1qIo';
  userName: string;
  etat = false;
  etatDeNotification: string;

  constructor(
    private auth: AuthService,
    private router: Router,
    private notifService: NotificationService,
  ) { }

  ngOnInit(): void {
    this.userName = this.auth.getUserName();
    this.etat = this.auth.getUserEtatSub();
    this.changeEtat();
  }

  logout() {
    this.auth.logout();
    this.router.navigate(['login']);
  }

  changeEtat() {
    if (this.etat) {
      this.etatDeNotification = "Notification activée";
    } else {
      this.etatDeNotification = "Notification désactivée";
    }
  }

  checkAuthorization() {
    this.etat = !this.etat;
    this.changeEtat();
    if (this.etat) {
      this.notifService.changeStateOfSubscription(1, this.auth.getUserId())
        .then( (res) =>{
          console.log(res);
        } );
      this.notifService.subscribeServiceWorker(this.publicKey);
    } else {
      this.notifService.changeStateOfSubscription(0, this.auth.getUserId())
        .then( (res) => {
          console.log(res);
        });
    }
  }

  toNotifications() {
    this.router.navigate(['list-notifications']);
  }
}
