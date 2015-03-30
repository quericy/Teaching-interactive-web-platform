<footer>
    <hr>
    <p class="pull-right">© 2015 Powered By chenyi	 ,All Rights Reserved.</p>
</footer>
<script src="<{$base_url}>js/jquery.min.js"></script>
<script src="<{$base_url}>js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function() {
        var uls = $('.sidebar-nav > ul > *').clone();
        uls.addClass('visible-xs');
        $('#main-menu').append(uls.clone());
    });
</script>