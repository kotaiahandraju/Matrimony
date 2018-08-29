$(document).ready(function()
{
$("#education_type").change(function()
{
var id=$(this).val();



var dataString = 'id='+ encodeURIComponent(id) ;



$.ajax
({
type: "POST",
url: "education.php",
data: dataString,
cache: false,
success: function(html)
{
$("#highest_education").html(html);
} 
});
});
});


$(document).ready(function()
{
$("#occupation_type").change(function()
{
var id=$(this).val();



var dataString = 'id='+ encodeURIComponent(id) ;



$.ajax
({
type: "POST",
url: "occupation.php",
data: dataString,
cache: false,
success: function(html)
{
$("#occupation").html(html);
} 
});
});
});


$(document).ready(function()
{
$("#country").change(function()
{
var id=$(this).val();



var dataString = 'id='+ encodeURIComponent(id) ;



$.ajax
({
type: "POST",
url: "state.php",
data: dataString,
cache: false,
success: function(html)
{
$("#state").html(html);
} 
});
});
});


$(document).ready(function()
{
$("#state").change(function()
{
var id=$(this).val();



var dataString = 'id='+ encodeURIComponent(id) ;



$.ajax
({
type: "POST",
url: "city.php",
data: dataString,
cache: false,
success: function(html)
{
$("#city").html(html);
} 
});
});
});