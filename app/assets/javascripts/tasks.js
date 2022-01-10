document.addEventListener('turbolinks:load', function () {
  document.querySelectorAll('td').forEach(function (td) {
    td.addEventListener('mouseover', function (e) {
      e.currentTarget.style.backgroundColor = '#eff';
    });

    td.addEventListener('mouseout', function (e) {
      e.currentTarget.style.backgroundColor = '';
    });
  });
});

// document.addEventListener('turbolinks:load', function() {
//     document.querySelectorAll('.delete').forEach(function(a) {
//         a.addEventListener('ajax:success', function() {
//             const td = a.parentNode;
//             const tr = td.parentNode;
//             tr.style.display = 'none';
//         });
//     });
// });
