$(function(){
  $(".other_job_text").hide();
});

$('input[name="member[job]"]').change( function() {
  if ($(this).val() === 'others')
    $(".other_job_text").show("slow");
  else
    $(".other_job_text").hide("slow");
});
