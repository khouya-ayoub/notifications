import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup} from "@angular/forms";
import {NotificationService} from "../services/notification.service";

@Component({
  selector: 'app-add-user',
  templateUrl: './add-user.component.html',
  styleUrls: ['./add-user.component.scss']
})
export class AddUserComponent implements OnInit {
  addAddUserForm: FormGroup;

  constructor(private notifService: NotificationService,
              private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.initForm();
  }

  initForm() {
    this.addAddUserForm = this.formBuilder.group({
      nom: [],
      prenom: [],
      login: [],
      password: [],
      group: [],
      qui: [],
      date: []
    });
  }

  onSubmitAddUserForm() {
    const user = this.addAddUserForm.value;
    console.log(user);
    this.notifService
      .addUser(user.nom, user.prenom, user.login, user.password, user.group, user.qui, user.date)
      .then();
  }
}
