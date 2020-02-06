import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {AuthentificationService} from '../services/authentification.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {

  private userName: string;

  constructor(private route: ActivatedRoute, private auth: AuthentificationService) { }

  ngOnInit() {
    this.userName = this.auth.getUser().getNom();
  }

}
