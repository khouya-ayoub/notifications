import { Component, OnInit } from '@angular/core';
import {AuthentificationService} from '../services/authentification.service';
import {Router} from '@angular/router';
import {NgForm} from '@angular/forms';
import Swal from 'sweetalert2';
import {SwPush} from '@angular/service-worker';

const Toast = Swal.mixin({
  toast: true,
  position: 'top',
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: true,
  onOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer);
    toast.addEventListener('mouseleave', Swal.resumeTimer);
  }
});

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  readonly VAPID_PUBLIC_KEY = 'BCT2k3SB7ik0ImupHWPcFg_otJaPHYvy0omRIsT9owvMCUw93ZjmcPMbpj4JkDMgyyss9LdVJg5sPf6z8Xt6G34';

  private authStatus: boolean;
  private userLogin: string;
  private userPass: string;

  constructor(private authService: AuthentificationService, private router: Router, readonly swPush: SwPush) { }

  ngOnInit() {
    this.authStatus = this.authService.getAuthentification();
  }

  onSignOut() {
    this.authService.sinOutUser();
    this.authStatus = this.authService.getAuthentification();
  }

  onSubmit(form: NgForm) {
    console.log('Login : ' + form.value.email + '||' + form.value.pass);
    this.userLogin = form.value.email;
    this.userPass = form.value.pass;
    this.authService.signInUser(this.userLogin, this.userPass).then(
      (retour) => {
        if (retour) {
          Toast.fire({
            icon: 'success',
            title: 'Connexion réussie ' + this.authService.getUser().getExiste()
          });
          this.router.navigate(['/dashboard']);
        } else {
          Toast.fire({
            icon: 'error',
            title: 'Login ou mot de pass incorrecte'
          });
        }
      }
    );
  }

  private async subscribeToPush() {
    try {
      const sub = await this.swPush.requestSubscription({
        serverPublicKey: this.VAPID_PUBLIC_KEY,
      });
    } catch (err) {
      console.error('Could not subscribe due to :', err);
    }
  }

  subToNotif() {
    return this.subscribeToPush();
  }

}
