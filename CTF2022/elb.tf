# elastic load balancer for srv1 
resource "aws_elb" "srv1-lb" {
  name = "srv1-lb"
  #   availability_zones = var.azs
  subnets         = aws_subnet.public-srv1.*.id
  security_groups = [aws_security_group.allow-all.id]
  # blame-the-intern
  listener {
    instance_port     = 8594
    instance_protocol = "http"
    lb_port           = 8594
    lb_protocol       = "http"
  }
  
  # out-of-mind part 1
  listener {
    instance_port     = 45123
    instance_protocol = "tcp"
    lb_port           = 45123
    lb_protocol       = "tcp"
  }
  # safe-js
  listener {
    instance_port     = 3665
    instance_protocol = "http"
    lb_port           = 3665
    lb_protocol       = "http"
  }
  # stacks-of-flags
  listener {
    instance_port     = 1946
    instance_protocol = "tcp"
    lb_port           = 1946
    lb_protocol       = "tcp"
  }
  # diversionary-havoc
  listener {
    instance_port     = 20000
    instance_protocol = "tcp"
    lb_port           = 20000
    lb_protocol       = "tcp"
  }
  
  # compare-and-contrast
  listener {
    instance_port     = 43212
    instance_protocol = "http"
    lb_port           = 43212
    lb_protocol       = "http"
  }
  # mission-impossible
  listener {
    instance_port     = 45451
    instance_protocol = "http"
    lb_port           = 45451
    lb_protocol       = "http"
  }
  # out-of-mind part 1
  listener {
    instance_port     = 45123
    instance_protocol = "tcp"
    lb_port           = 45123
    lb_protocol       = "tcp"
  }

  # out-of-mind part 2
  listener {
    instance_port     = 12323
    instance_protocol = "tcp"
    lb_port           = 12323
    lb_protocol       = "tcp"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "srv1-lb"
  }
}

# elastic load balancer for srv2
resource "aws_elb" "srv2-lb" {
  name = "srv2-lb"
  #   availability_zones = var.azs
  subnets         = aws_subnet.public-srv2.*.id
  security_groups = [aws_security_group.allow-all.id]
  # crack-the-safe
  listener {
    instance_port     = 3467
    instance_protocol = "http"
    lb_port           = 3467
    lb_protocol       = "http"
  }
  # last-act-of-defiance
  listener {
    instance_port     = 9355
    instance_protocol = "http"
    lb_port           = 9355
    lb_protocol       = "http"
  }
  # old-family-recipe
  listener {
    instance_port     = 9949
    instance_protocol = "http"
    lb_port           = 9949
    lb_protocol       = "http"
  }
  # garbage-collector-frontend  
  listener {
    instance_port     = 8081
    instance_protocol = "http"
    lb_port           = 8081
    lb_protocol       = "http"
  }
  # garbage-collector-frontend
  listener {
    instance_port     = 3000
    instance_protocol = "http"
    lb_port           = 3000
    lb_protocol       = "http"
  }
  # scattered-letters
  listener {
    instance_port     = 7633
    instance_protocol = "http"
    lb_port           = 7633
    lb_protocol       = "http"
  }
  # sticky-note
  listener {
    instance_port     = 2222
    instance_protocol = "tcp"
    lb_port           = 2222
    lb_protocol       = "tcp"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "srv2-lb"
  }
}

# elastic load balancer for srv3
resource "aws_elb" "srv3-lb" {
  name = "srv3-lb"
  #   availability_zones = var.azs
  subnets         = aws_subnet.public-srv3.*.id
  security_groups = [aws_security_group.allow-all.id]
  # secure-ls
  listener {
    instance_port     = 8754
    instance_protocol = "tcp"
    lb_port           = 8754
    lb_protocol       = "tcp"
  }
  # our-files
  listener {
    instance_port     = 23211
    instance_protocol = "http"
    lb_port           = 23211
    lb_protocol       = "http"
  }
  # one-true-encryption
  listener {
    instance_port     = 31337
    instance_protocol = "tcp"
    lb_port           = 31337
    lb_protocol       = "tcp"
  }
  # intact
  listener {
    instance_port     = 2007
    instance_protocol = "tcp"
    lb_port           = 2007
    lb_protocol       = "tcp"
  }
  # biometric-heap
  listener {
    instance_port     = 3609
    instance_protocol = "tcp"
    lb_port           = 3609
    lb_protocol       = "tcp"
  }
  # magpienet listeners #
  listener {
    instance_port     = 46442
    instance_protocol = "tcp"
    lb_port           = 46442
    lb_protocol       = "tcp"
  }
  listener {
    instance_port     = 46487
    instance_protocol = "tcp"
    lb_port           = 46487
    lb_protocol       = "tcp"
  }
  listener {
    instance_port     = 46441
    instance_protocol = "tcp"
    lb_port           = 46441
    lb_protocol       = "tcp"
  }
  listener {
    instance_port     = 46301
    instance_protocol = "tcp"
    lb_port           = 46301
    lb_protocol       = "tcp"
  }
  listener {
    instance_port     = 46316
    instance_protocol = "tcp"
    lb_port           = 46316
    lb_protocol       = "tcp"
  }
  listener {
    instance_port     = 46102
    instance_protocol = "tcp"
    lb_port           = 46102
    lb_protocol       = "tcp"
  }
  listener {
    instance_port     = 46911
    instance_protocol = "tcp"
    lb_port           = 46911
    lb_protocol       = "tcp"
  }
  listener {
    instance_port     = 46382
    instance_protocol = "tcp"
    lb_port           = 46382
    lb_protocol       = "tcp"
  }
  listener {
    instance_port     = 41111
    instance_protocol = "tcp"
    lb_port           = 41111
    lb_protocol       = "tcp"
  }
  listener {
    instance_port     = 41122
    instance_protocol = "tcp"
    lb_port           = 41122
    lb_protocol       = "tcp"
  }
  listener {
    instance_port     = 49988
    instance_protocol = "tcp"
    lb_port           = 49988
    lb_protocol       = "tcp"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "srv3-lb"
  }
}

# elastic load balancer for srv4
resource "aws_elb" "srv4-lb" {
  name = "srv4-lb"
  #   availability_zones = var.azs
  subnets         = aws_subnet.public-srv4.*.id
  security_groups = [aws_security_group.allow-all.id]

  # one-true-encryption
  listener {
    instance_port     = 31337
    instance_protocol = "tcp"
    lb_port           = 31337
    lb_protocol       = "tcp"
  }
 
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "srv4-lb"
  }
}

# elastic load balancer for websites 
resource "aws_elb" "sites-lb" {
  name            = "sites-lb"
  subnets         = aws_subnet.public-sites.*.id
  security_groups = [aws_security_group.allow-all.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  listener {
    instance_port     = 443
    instance_protocol = "tcp"
    lb_port           = 443
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "websites-lb"
  }
}

## attach srv1 ro elb1 

resource "aws_elb_attachment" "srv1-attachment" {
  count    = length(var.subnets_cidr_srv1)
  # count    = 0
  elb      = aws_elb.srv1-lb.id
  instance = element(aws_instance.srv1.*.id, count.index)
}

## attach srv2 ro elb2 

resource "aws_elb_attachment" "srv2-attachment" {
  count = length(var.subnets_cidr_srv2)
  # count =0
  elb      = aws_elb.srv2-lb.id
  instance = element(aws_instance.srv2.*.id, count.index)
}

## attach srv3 to elb3

resource "aws_elb_attachment" "srv3-attachment" {
  count = length(var.subnets_cidr_srv3)
  # count =0
  elb      = aws_elb.srv3-lb.id
  instance = element(aws_instance.srv3.*.id, count.index)
}

## attach srv4 to elb4

resource "aws_elb_attachment" "srv4-attachment" {
  count = length(var.subnets_cidr_srv4)
  # count =0
  elb      = aws_elb.srv4-lb.id
  instance = element(aws_instance.srv4.*.id, count.index)
}


## attach sites to elb


resource "aws_elb_attachment" "sites-attachment" {
  count = length(var.subnets_cidr_sites)
  # count =0
  elb      = aws_elb.sites-lb.id
  instance = element(aws_instance.sites.*.id, count.index)
}
