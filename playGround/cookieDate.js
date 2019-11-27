//  Setting an expiry date on your cookies
let days = 2;
let expiry = new Date();

// The below sets when the cookie will expire. This is saying setTime, then its 2 days to milliseconds
expiry.setTime(expiry.getTime() + (days * 24 * 60 * 60 * 1000));

// UTC sets the time so its the same for everyone around the world
// If you wish to set the expire data on the cookie you need to do the `expires=`
document.cookie = `lang=english;expires=${expiry.toUTCString()};path=/`

function removeCookie(name) {
  
  // The below sets the date
  expiry = Date();
  // The below is saying the the cookie will remove when 
  document.cookie = `expires=${expiry.toUTCString()}`;
}