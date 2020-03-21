import {ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot} from '@angular/router';
import {Observable} from 'rxjs/Observable';
import {Injectable} from '@angular/core';
import {AuthentificationService} from './authentification.service';

@Injectable()
export class AuthGuardService implements CanActivate {

  constructor(private authService: AuthentificationService, private router: Router) {}

  canActivate(route: ActivatedRouteSnapshot,
              state: RouterStateSnapshot
  ): Observable<boolean > | Promise<boolean> | boolean {
    if (this.authService.getAuthentification()) {
      return true;
    } else {
      this.router.navigate(['/login']);
    }
  }


}
