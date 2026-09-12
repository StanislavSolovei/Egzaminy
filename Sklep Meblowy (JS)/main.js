function zamienaGlownegoObrazu(element){
    const glowny = document.getElementById("glowny");
    glowny.src = element.src;
}

function otwieraOkno(){
    const glowny = document.getElementById("glowny");
    const okno = document.querySelector('.okno');
    const obrazOkno = document.querySelector('.obrazOkno');

    obrazOkno.src = glowny.src;
    okno.style.display = 'block';
}

function zamknijOkno(){
    const okno = document.querySelector('.okno');
    okno.style.display = 'none';
}