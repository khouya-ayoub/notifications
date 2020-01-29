import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {LoginComponent} from './login/login.component';
import {DashboardComponent} from './dashboard/dashboard.component';
import {FourOhFourComponent} from './four-oh-four/four-oh-four.component';
import {AuthGuardService} from './services/auth-guard.service';


const routes: Routes = [
  { path: 'login', component: LoginComponent},
  { path: 'dashboard', canActivate: [AuthGuardService], component: DashboardComponent },
  { path: '', component: LoginComponent },
  { path: 'not-found', component: FourOhFourComponent },
  { path: '**', redirectTo: '/not-found' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
