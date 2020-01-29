import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {

  private userName = 'Ayoub';

  constructor(private route: ActivatedRoute) { }

  ngOnInit() {
    this.userName = this.route.snapshot.params.user;
  }

}
