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

  constructor(
    private auth: AuthService,
    private router: Router,
    private notifService: NotificationService,
  ) { }

  ngOnInit(): void {
    this.userName = this.auth.getUserName();
  }

  logout() {
    this.auth.logout();
    this.router.navigate(['login']);
  }

  checkAuthorization() {
    this.notifService.subscribeServiceWorker(this.publicKey);
  }
}
