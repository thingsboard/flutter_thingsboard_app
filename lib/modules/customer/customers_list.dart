// Copyright © 2021-2026 ThingsBoard, Inc.
//
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';
import 'package:thingsboard_app/modules/customer/customers_base.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class CustomersList extends BaseEntitiesWidget<Customer, PageLink>
    with CustomersBase, ContactBasedBase, EntitiesListStateBase {
  CustomersList(super.pageKeyController, {super.key, super.searchMode});

}
