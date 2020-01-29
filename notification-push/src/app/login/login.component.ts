import { Component, OnInit } from '@angular/core';
import {AuthentificationService} from '../services/authentification.service';
import {Router} from "@angular/router";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  private authStatus: boolean;
  private userName = 'test-user';

  constructor(private authService: AuthentificationService, private router: Router) { }

  ngOnInit() {
    this.authStatus = this.authService.getAuthentification();
  }

  onSignIn() {
    this.authService.signInUser().then(
      () => {
        console.log('Authentification done !');
        this.authStatus = this.authService.getAuthentification();
        this.router.navigate(['dashboard']);
      }
    );
  }

  onSignOut() {
    this.authService.sinOutUser();
    this.authStatus = this.authService.getAuthentification();
  }

}
