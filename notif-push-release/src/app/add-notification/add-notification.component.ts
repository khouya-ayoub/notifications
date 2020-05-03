import { Component, OnInit } from '@angular/core';
import {NotificationService} from '../services/notification.service';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-add-notification',
  templateUrl: './add-notification.component.html',
  styleUrls: ['./add-notification.component.scss']
})
export class AddNotificationComponent implements OnInit {
  addNotificationForm: FormGroup;

  constructor(
    private noisService: NotificationService,
    private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.initFrm();
  }

  onSubmitAddNotifForm() {
    const notif = this.addNotificationForm.value;
    console.log(notif);
    this.noisService.addNotification(notif.titre, notif.description, notif.type, notif.cible, notif.qui, notif.date)
      .then((rep) => {
        console.log(rep);
      })
      .catch(err => {
        console.log(err);
      });
  }

  initFrm() {
    this.addNotificationForm = this.formBuilder.group({
      titre: [],
      description: [],
      type: [],
      cible: [],
      qui: [],
      date: []
  });
  }

}
