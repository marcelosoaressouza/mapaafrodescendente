// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require leaflet
//= require_tree .

markers = [];

$(document).ready(function() {

  $('#entidade').val('');

  $('#uf').on('change', function() {
    if ($('#uf').val()) {
      $.getJSON('/ufs/' + $(this).val() + '/municipios.json', function(data) {
        $('#municipio').empty();

        $.each(data, function(i, item) {
          $('#municipio').append('<option value="' + item.nome + '">' + item.nome + '</option>');
        });
      });
    }
    else
    {
      $('#municipio').empty();
    }
  });

  $('#entidade').on('change', function() {
    tipo = $(this).val();
    jQuery.each(markers, function() {
      map.removeLayer(this);
    });

    if (tipo != '')
    {
      $.ajax({
        type : 'get',
        url : '/entidades/lista/' + tipo + '.json',
        contentType : 'application/json; charset=utf-8',
        dataType : 'json',
        success : function(responseData) {
          jQuery.each(responseData, function() {
            idMarker = this["id"];
            marker = L.marker([this["latitude"], this["longitude"]]).addTo(map);
            marker.bindPopup('<center><h3><a href="/entidades/' + this["slug"] + '" > ' + this["entidade"] + ' </a></h3></center>');
            markers[idMarker] = marker;
          });
        }
      });
    }
  });
    
});
