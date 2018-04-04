 <script>

        function openTransferPage() {
            var formDate = $("#form1").serializeArray();
            var re = formDate.map(function (e) {
                return e.name + "=" + e.value;
            }).reduce(function (l, r) {
                return l + "&" + r;
            });
            var re2 = "/trade/transfer.action?".concat(re);
            window.open(re2);
        }

        $(function() {
            $("#manualTransferButton").on('click',openTransferPage)
        });

</script>
