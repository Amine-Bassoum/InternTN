function toggleWindow(bannerId) {
    var infoWindow = document.getElementById('infoWindow' + bannerId);
    infoWindow.classList.toggle('show-info');
}

function closeWindow(bannerId) {
    var infoWindow = document.getElementById('infoWindow' + bannerId);
    infoWindow.classList.remove('show-info');
}
a
