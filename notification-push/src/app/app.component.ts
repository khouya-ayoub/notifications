import {Component, OnInit} from '@angular/core';
import {SwPush} from '@angular/service-worker';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {

  constructor(
    readonly swPush: SwPush) {
  }

  ngOnInit(): void {
  }
}
