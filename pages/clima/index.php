<?php
include("../../temp/header.php");

// API Key de OpenWeatherMap
$apiKey = "b7a78e8d69f835ed44e7c49de9e85089";
// Coordenadas de San Luis Acatlán, Guerrero
$lat = 16.8070694;
$lon = -98.7350079;

// URL de la API con las coordenadas
$currentWeatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat={$lat}&lon={$lon}&units=metric&appid={$apiKey}&lang=es";
$forecastUrl = "https://api.openweathermap.org/data/2.5/forecast?lat={$lat}&lon={$lon}&units=metric&appid={$apiKey}&lang=es";

// Obtener datos del clima actual
$currentWeatherResponse = file_get_contents($currentWeatherUrl);
$currentWeatherData = json_decode($currentWeatherResponse, true);

// Obtener datos del pronóstico
$forecastResponse = file_get_contents($forecastUrl);
$forecastData = json_decode($forecastResponse, true);

// Extraer datos del clima actual
if ($currentWeatherData['cod'] == 200) {
    $locationName = $currentWeatherData['name'];
    $temperature = $currentWeatherData['main']['temp'];
    $description = $currentWeatherData['weather'][0]['description'];
    $icon = $currentWeatherData['weather'][0]['icon']; // Icono del clima
    $humidity = $currentWeatherData['main']['humidity'];
    $windSpeed = $currentWeatherData['wind']['speed'];
} else {
    $error = $currentWeatherData['message'];
}

// Extraer datos del pronóstico
$forecastList = [];
if ($forecastData['cod'] == "200") {
    foreach ($forecastData['list'] as $forecast) {
        $dateTime = $forecast['dt_txt'];
        $temp = $forecast['main']['temp'];
        $desc = $forecast['weather'][0]['description'];
        $icon = $forecast['weather'][0]['icon'];
        $forecastList[] = [
            'datetime' => $dateTime,
            'temp' => $temp,
            'desc' => $desc,
            'icon' => $icon
        ];
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clima en San Luis Acatlán</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #23272F;
            color: white;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            background: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            width: 80%;
            max-width: 400px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            margin-top: 130px; /* Se aumenta para evitar que el recuadro esté pegado al header */
        }
        .forecast-container {
            background: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            width: 90%;
            max-width: 1000px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            margin-top: 30px;
            display: flex;
            overflow-x: auto; /* Las tarjetas ocuparán múltiples líneas si es necesario */
            gap: 15px;
            justify-content: flex-start; /* Alinea las tarjetas al principio */
            padding-bottom: 20px; /* Asegura que haya espacio abajo si se necesitan varias líneas */
        }

        .forecast-item {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            text-align: center;
            padding: 10px;
            width: 140px; /* Aumenta el ancho para que no se vea recortado */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .forecast-item img {
            width: 60px;
            height: 60px;
        }
        footer {
            margin-top: 30px;
            padding: 10px;
            width: 100%;
            background: rgba(0, 0, 0, 0.7);
            text-align: center;
            color: white;
            font-size: 14px;
        }
        h3{
            color:white;
            font-size: 30px;
            text-align: center;
            margin-top: 30px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
            font-family: 'Montserrat', sans-serif;
        }
    </style>
</head>
<body>
    <!-- Clima Actual -->
    <div class="container">
        <h1>Clima en San Luis Acatlán, Guerrero</h1>
        <div class="weather-info">
            <?php if (isset($temperature)): ?>
                <img class="weather-icon" src="https://openweathermap.org/img/wn/<?= $icon ?>@2x.png" alt="Icono del clima">
                <h2><?= htmlspecialchars($locationName) ?></h2>
                <p><strong>Temperatura:</strong> <?= $temperature ?>°C</p>
                <p><strong>Descripción:</strong> <?= ucfirst($description) ?></p>
                <p><strong>Humedad:</strong> <?= $humidity ?>%</p>
                <p><strong>Velocidad del viento:</strong> <?= $windSpeed ?> m/s</p>
            <?php elseif (isset($error)): ?>
                <p class="error"><strong>Error:</strong> <?= htmlspecialchars($error) ?></p>
            <?php endif; ?>
        </div>
    </div>

    <!-- Pronóstico -->
     <h3>Pronostico del clima en los proximos dias</h3>
    <div class="forecast-container">
        <?php foreach ($forecastList as $forecast): ?>
            <div class="forecast-item">
                <p><strong><?= date("d/m H:i", strtotime($forecast['datetime'])) ?></strong></p>
                <img src="https://openweathermap.org/img/wn/<?= $forecast['icon'] ?>@2x.png" alt="Icono">
                <p><?= $forecast['temp'] ?>°C</p>
                <p><?= ucfirst($forecast['desc']) ?></p>
            </div>
        <?php endforeach; ?>
    </div>
</body>
</html>
