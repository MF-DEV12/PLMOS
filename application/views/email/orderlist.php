<!DOCTYPE>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
	<title>Order Receipt</title>
</head>
<body>

<div class="alert alert-success">
  <h3><strong>ORDER NUMBER: <?=$orderno?></strong></h3><br/>
  Ship To: <strong><?=COMPANY_NAME;?></strong>
</div>



<table class="table">

	<thead class="thead-inverse">
		<tr>
			<th>#</th>
			<th>Item Number</th>
			<th>Name / Description</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total</th>
		</tr>
	</thead>
	<tbody>
		<?php $i = 1; ?>
		<?php $total = 0.00; ?>
		<?php foreach($item as $key){ ?>
			<tr>
				<td><?=$i;?></td>
				<td><?=$key->ItemNumber?></td>
				<td><?=$key->ItemDescription?></td>
				<td><?=number_format($key->Price,2)?></td>
				<td><?=$key->Quantity?></td>
				<td><?=number_format($key->Total,2)?></td>
				<?php $i++; ?>
				<?php $total += (float)$key->Total; ?>
			</tr>
		<?php } ?>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5" align="right">Total:</td>
			<td><strong><?=number_format($total,2);?></strong></td>
		</tr>
	</tfoot>
	
</table>


<p>Kind regards,<br/>
<?=COMPANY_NAME;?>
</p>

</body>
</html>