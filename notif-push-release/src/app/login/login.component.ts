import { Component, OnInit } from '@angular/core';
import {AuthService} from '../services/auth.service';
import {Router} from '@angular/router';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  private authStatus: boolean;
  loginForm: FormGroup;

  constructor(
    private authService: AuthService,
    private router: Router,
    private fromBuilder: FormBuilder
  ) {
  }

  ngOnInit(): void {
    this.authStatus = this.authService.getAuthStatus();
    this.initLoginForm();
  }

  initLoginForm() {
    this.loginForm = this.fromBuilder.group({
      login: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  onSubmitLoginForm() {
    const loginValues = this.loginForm.value;
    this.authService.login(
      loginValues.login,
      loginValues.password
    ).then(() => {
      this.router.navigate(['dashboard']);
    })
      .catch(err => {
        console.log(err);
      });
  }
}
