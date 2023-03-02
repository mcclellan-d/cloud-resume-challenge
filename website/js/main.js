function visitorCount() {
    visitorCounter = document.getElementById('visitors');
    apiURL = 'https://8qlflusyl7.execute-api.us-east-1.amazonaws.com/prod/VisitCountFunction'
    fetch( apiURL ).then((response) =>
        response.json().then((data) => visitorCounter.innerHTML = data.totalVisits)
    );
}

window.onload = visitorCount();


