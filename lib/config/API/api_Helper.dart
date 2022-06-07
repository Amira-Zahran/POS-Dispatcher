class API{
  static final url = 'https://osharif.xyz';

  static final base = url + '/api/';

  static final login = base + 'login';

  static final DispatcherRoute = base + 'Dispatching/';

  static final OrderRoute = base + 'Order/';

  static final getAgent = DispatcherRoute+'getDeliveryAgents';

  static final getOrders = DispatcherRoute+'getOrders';

  static final acceptOrder = DispatcherRoute+'acceptOrder';

  static final updateStatus = DispatcherRoute+'updateStatus';

  static final history = OrderRoute+'history';

  static final createOp = DispatcherRoute+ 'createDeliveryOperation';

  static final printReceipt = OrderRoute+'createPDF';
}