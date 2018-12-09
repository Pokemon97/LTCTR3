@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				{{--<h6 class="inner-title">Đặt hàng</h6>--}}
				<h6><b style="font-size: 120%; color: red">@if(Session::has('success')){{Session::get('success')}}@endif</b></h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('home-page')}}">Home</a> / <span>Đặt hàng</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	@if(Session::has('cart'))
	<div class="container">
		<div id="content">
			
			<form action="{{route('checkout')}}" method="post" class="beta-form-checkout">
				<input type="hidden" name="_token" value="{{csrf_token()}}">
				<!--<div class="row">@if(Session::has('thongbao')){{Session::get('thongbao')}}@endif</div>-->
				<div class="row">
					<div class="col-sm-6">
						<h4>Đặt hàng</h4>
						<div class="space20">&nbsp;</div>

						<div class="form-block">
							<label for="name">Họ tên*</label>
							<input type="text" id="name" placeholder="Họ tên" name="name" 
							@if(Auth::check()) 
							value="{{Auth::user()->full_name}}"
							@endif
							required>
						</div>
						<div class="form-block">
							<label>Giới tính </label>
							<input id="gender" type="radio" class="input-radio" name="gender" value="nam" checked="checked" style="width: 10%"><span style="margin-right: 10%">Nam</span>
							<input id="gender" type="radio" class="input-radio" name="gender" value="nữ" style="width: 10%"><span>Nữ</span>
										
						</div>

						<div class="form-block">
							<label for="email">Email*</label>
							<input type="email" id="email" name="email" 
							@if(Auth::check()) 
							value="{{Auth::user()->email}}" 
							readonly="" 
							@endif
							required placeholder="expample@gmail.com">
						</div>

						<div class="form-block">
							<label for="adress">Địa chỉ*</label>
							<input type="text" id="adress" name="address" placeholder="Street Address" 
							@if(Auth::check())
							value="{{Auth::user()->address}}" 
							@endif
							required>
						</div>
						

						<div class="form-block">
							<label for="phone">Điện thoại*</label>
							<input type="text" id="phone" name="phone" 
							@if(Auth::check())
							value="{{Auth::user()->phone}}"
							@endif
							required pattern="[0-9]{10}">
						</div>
						
						<div class="form-block">
							<label for="notes">Ghi chú</label>
							<textarea id="notes" name="notes"></textarea>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="your-order">
							<div class="your-order-head"><h5>Đơn hàng của bạn</h5></div>
							<div class="your-order-body" style="padding: 0px 10px">
								<div class="your-order-item">
									<div>
										@if(Session::has('cart'))
										@foreach($product_cart as $cart)
										<!--  one item	 -->
											<div class="media">
												<img width="25%" src="source/image/product/{{$cart['item']['image']}}" alt="" class="pull-left">
												<div class="media-body">
													<p class="font-large">{{$cart['item']['name']}}</p>
													<br/>
													<span class="color-gray your-order-info">Đơn giá: {{number_format($cart['price']/$cart['qty'])}} đồng</span>
													<br/>
													<span class="color-gray your-order-info">Số lượng: {{$cart['qty']}}</span>
												</div>
											</div>
										<!-- end one item -->
										@endforeach
										@endif
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="your-order-item">
									<div class="pull-left"><p class="your-order-f18">Tổng tiền:</p></div>
									<div class="pull-right"><h5 class="color-black">@if(Session::has('cart')){{number_format($totalPrice)}}@else 0 @endif đồng</h5></div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="your-order-head"><h5>Hình thức thanh toán</h5></div>
							
							<div class="your-order-body">
								<ul class="payment_methods methods">
									<li class="payment_method_bacs">
										<input id="payment_method_bacs" type="radio" class="input-radio" name="payment_method" value="COD" checked="checked" data-order_button_text="">
										<label for="payment_method_bacs">Thanh toán khi nhận hàng </label>
										<div class="payment_box payment_method_bacs" style="display: block;">
											Cửa hàng sẽ gửi hàng đến địa chỉ của bạn, bạn xem hàng rồi thanh toán tiền cho nhân viên giao hàng
										</div>						
									</li>

									<li class="payment_method_cheque">
										<input id="payment_method_cheque" type="radio" class="input-radio" name="payment_method" value="ATM" data-order_button_text="">
										<label for="payment_method_cheque">Chuyển khoản </label>
										<div class="payment_box payment_method_cheque" style="display: none;">
											Chuyển tiền đến tài khoản sau:
											<br>- Số tài khoản: 123 456 789
											<br>- Chủ tài khoản: Vũ Tuấn Anh
											<br>- Ngân hàng VP Bank
										</div>						
									</li>
									
								</ul>
							</div>

							@if(number_format($totalPrice))
							<div class="text-center"><button type="submit" class="beta-btn primary">Đặt hàng<i class="fa fa-chevron-right"></i></div>
							@else
							<div class="text-center"><a href="{{route('home-page')}}"><b style="color: blue; font-size: 80%" >Tiếp tục mua hàng</b></a></div>
							@endif
						</div> <!-- .your-order -->
					</div>
				</div>
			</form>
		</div> <!-- #content -->
	</div> <!-- .container -->
	@else
		<div class="container">
			<div id="content">
				<div class="space20">&nbsp;</div>
				<div class="space20">&nbsp;</div>
				<h6><a href="{{route('home-page')}}"><b style="color: blue; font-size: 80%" >Tiếp tục mua hàng</b></a></h6>
				<div class="space20">&nbsp;</div>
				<div class="space20">&nbsp;</div>
			</div>
		</div>
	@endif
@endsection