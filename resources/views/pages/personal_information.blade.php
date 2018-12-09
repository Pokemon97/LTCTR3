@extends('master')
@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h3 class="inner-title">Xem thông tin</h3>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('home-page')}}">Home</a> / <span>Thông tin cá nhân</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	
	<div class="container">
		<div id="content">
			
			<form  class="beta-form-checkout">
				
						<div class="col-sm-4">
					
							<h4>Thông tin cá nhân </h4>
							<div class="space20">&nbsp;</div>

							<div class="form-block">
								<label for="email">Email: {{Auth::user()->email}}</label>
							</div>

							<div class="form-block">
								<label for="your_last_name">Họ Tên: {{Auth::user()->full_name}}</label>
							</div>

							<div class="form-block">
								<label for="adress">Địa Chỉ: {{Auth::user()->address}}</label>
							</div>

							<div class="form-block">
								<label for="phone">Điện Thoại: {{Auth::user()->phone}}</label>
							</div>
							<div class="form-block">	

							
							<a href="{{route('change_information')}}"><b style="color: blue; font-size: 120%">Sửa thông tin</b></a>
							</div>
						</div>	
						
						<div class="col-sm-8">
							<h4>Thông tin đơn hàng</h4>
							
							<table class="table table-striped table-bordered table-hover" id="dataTables-example">
								<tr>
									<td>Mã đơn hàng</td>
									<td>Ngày đặt hàng</td>
									<td>Tổng tiền</td>
									<td>Hình thức thanh toán</td>
									<td>Ghi chú</td>
									<td>Trạng thái</td>
								</tr>
								@foreach($customer as $cus)
									@foreach($cus->bill as $bill)
										<tr>
											<td>{{$bill->id}}</td>
											<td>{{$bill->date_order}}</td>
											<td>{{$bill->total}}</td>
											<td>{{$bill->payment}}</td>
											<td>{{$bill->note}}</td>
											<td>
												@if($bill->status == 0)
													Chưa nhận hàng
												@else
													Đã nhận hàng
												@endif
											</td>
										</tr>
									@endforeach
								@endforeach
							</table>
						</div>						
				
			</form>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection