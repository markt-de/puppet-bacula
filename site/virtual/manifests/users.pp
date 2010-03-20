class virtual::users {
 include virtual::groups
 @account::user {'teyo':
    comment => 'Teyo, Tyree',
    group => sysadmin,
    tag => sysadmin,
 }
 @account::user {'james':
    comment => 'James Turnbull',
    group => sysadmin,
    tag => sysadmin,
 }
 @account::user {'dan':
    comment => 'Dan Bode',
    group => sysadmin,
    tag => sysadmin,
 }
}
