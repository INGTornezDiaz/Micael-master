<?php
// Configuración de la conexión
$dsn = 'mysql:host=localhost;dbname=acapulco;charset=utf8';
$usuario = 'root';
$contraseña = '567890';

// Intentar establecer la conexión
try {
    $conexion = new PDO($dsn, $usuario, $contraseña);
    // Establecer el modo de error a excepción
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Si hay un error en la conexión, mostrarlo
    echo 'Error de conexión: ' . $e->getMessage();
    exit;
}
