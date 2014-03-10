
$(function () {
	$('select#order').on('change', function () {
		localStorage.setItem("select", $(this).val());
		$(this).closest('form').trigger('submit');
	});
	$(this).val(localStorage.getItem("select"));
});
