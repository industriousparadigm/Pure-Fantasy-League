$('.leagues.index').ready(() => {
  $('#league_season').on('change', function() {
    location = `/admin/leagues?by_season=${$(this).val()}`
  })
})

$('.leagues.show').ready(() => {
  $('[data-toggle="tooltip"]').tooltip()
})
