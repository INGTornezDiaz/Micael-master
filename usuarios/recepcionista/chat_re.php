<?php
$host = $_SERVER['HTTP_HOST'];
$url = "../chat/templates/chat_recep.html";
?>
<script>
    window.onload = function() {
        window.location.href = "<?php echo $url; ?>";
    }
</script>
