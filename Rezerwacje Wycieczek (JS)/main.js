const przyciskUczestnik = document.getElementById('uczestnik');
const przyciskRezerwacja = document.getElementById('rezerwacja');
const imie = document.getElementById('imie');
const nazwisko = document.getElementById('nazwisko');
const liczbaOsob = document.getElementById('liczbaOsob');
const miejsceWylotu = document.getElementById('miejsceWylotu');
const warszawa = document.getElementById('warszawa');
const krakow = document.getElementById('krakow');
const wroclaw = document.getElementById('wroclaw');
const sniadanie = document.getElementById('sniadanie');
const obiadokolacje = document.getElementById('obiadokolacje');
const inclusive = document.getElementById('inclusive');


przyciskUczestnik.style.backgroundColor = "DodgerBlue";

function uczestnik(){
    przyciskUczestnik.style.background = "DodgerBlue";
    przyciskRezerwacja.style.background  = "SkyBlue";
    imie.disabled = false;
    nazwisko.disabled = false;
    liczbaOsob.disabled = true;
    miejsceWylotu.disabled = true;
    sniadanie.disabled = true;
    obiadokolacje.disabled = true;
    inclusive.disabled = true;
    warszawa.disable = true;
    krakow.disabled = true;
    wroclaw.disabled = true;
}

function rezerwacja(){
    przyciskRezerwacja.style.background = "DodgerBlue";
    przyciskUczestnik.style.background  = "SkyBlue";
    imie.disabled = true;
    nazwisko.disabled = true;
    liczbaOsob.disabled = false;
    miejsceWylotu.disabled = false;
    sniadanie.disabled = false;
    obiadokolacje.disabled = false;
    inclusive.disabled = false;
    warszawa.disabled = false;
    krakow.disabled = false;
    wroclaw.disabled = false;
}

const nazwa = document.getElementById('nazwa');
const obraz = document.getElementById('obraz');

let numer = 1;

function mniej(){
    numer --;

    if(numer < 1){
        numer = 3
    }

    if(numer == 1){
        obraz.src = "1.jpg";
        nazwa.innerHTML = "Barcelona";
    } else if(numer == 2){
        obraz.src = "2.jpg";
        nazwa.innerHTML = "Rzym";
    } else if(numer == 3){
        obraz.src = "3.jpg";
        nazwa.innerHTML = "Londyn";
    }
}

function wiecej(){
    numer++;

    if(numer > 3){
        numer = 1
    }

    if(numer == 1){
        obraz.src = "1.jpg";
        nazwa.innerHTML = "Barcelona";
    } else if(numer == 2){
        obraz.src = "2.jpg";
        nazwa.innerHTML = "Rzym";
    } else if(numer == 3){
        obraz.src = "3.jpg";
        nazwa.innerHTML = "Londyn";
    }
}