/**
 * Created by Cyndi on 3/13/2015.
 */

$('#cart').html("<%= escape_javascript(render @cart) %>");

$('#the_pets').html("<%= escape_javascript(render @pets) %>");
