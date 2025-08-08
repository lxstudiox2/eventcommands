let countdown = 60;
let interval   = null;

window.addEventListener('message', (event) => {
    const data = event.data;

    /* mostrar */
    if (data.type === 'mostrarAnuncio') {
        const box = document.getElementById('eventoBox');
        box.classList.remove('hidden');

        document.getElementById('texto').innerText   = data.texto;
        document.getElementById('autor').innerText   = "Administrador (" + data.autor + ")";
        countdown = 60;
        document.getElementById('contador').innerText = countdown + " s";

        clearInterval(interval);
        interval = setInterval(() => {
            countdown--;
            document.getElementById('contador').innerText = countdown + " s";
            if (countdown <= 0){
                clearInterval(interval);
                box.classList.add('hidden');
            }
        }, 1000);
    }

    if (data.type === 'ocultarAnuncio') {
        document.getElementById('eventoBox').classList.add('hidden');
        clearInterval(interval);
    }

    if (data.type === 'presionoF3') {
        fetch(`https://${GetParentResourceName()}/teleportarEvento`,{
            method:'POST',
            headers:{'Content-Type':'application/json'},
            body:'{}'
        });
    }
});
