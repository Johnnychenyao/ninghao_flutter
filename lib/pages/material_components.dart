import 'package:flutter/material.dart';
import './material_demos/button_demo.dart';
import './material_demos/floating_action_button_demo.dart';
import './material_demos/checkbox_demo.dart';
import './material_demos/radio_demo.dart';
import './material_demos/switch_demo.dart';
import './material_demos/slider_demo.dart';
import './material_demos/date_time_demo.dart';
import './material_demos/alert_dialog_demo.dart';
import './material_demos/simple_dialog_demo.dart';
import './material_demos/bottom_sheet_demo.dart';
import './material_demos/snack_bar_demo.dart';
import './material_demos/expansion_panel_demo.dart';
import './material_demos/chip_demo.dart';
import './material_demos/data_table_demo.dart';
import './material_demos/paginated_data_table_demo.dart';
import './material_demos/card_demo.dart';
import './material_demos/stepper_demo.dart';
import './material_demos/state_management_demo.dart';
import './material_demos/stream_demo.dart';
import './rxdart/rxdart_demo.dart';
import 'bloc/bloc_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListItem(title: 'FloatingActionButton - 浮动按钮', page: FloatingActionButtonDemo(),),
        ListItem(title: 'Button - 按钮', page: ButtonDemo(),),
        ListItem(title: 'Checkbox - 多选', page: CheckboxDemo(),),
        ListItem(title: 'Radio - 单选', page: RadioDemo(),),
        ListItem(title: 'Switch - 开关', page: SwitchDemo(),),
        ListItem(title: 'Slider - 滑动条', page: SliderDemo(),),
        ListItem(title: 'DateTime - 日期时间选择器-插件', page: DateTimeDemo(),),
        ListItem(title: 'SimpleDialog - 显示对话框', page: SimpleDialogDemo(),),
        ListItem(title: 'AlertDialog - 提示对话框', page: AlertDialogDemo(),),
        ListItem(title: 'BottomSheet - 底部滑动窗口', page: BottomSheetDemo(),),
        ListItem(title: 'SnackBar - 操作提示框', page: SnackBarDemo(),),
        ListItem(title: 'ExpansionPanel - 收缩面板', page: ExpansionPanelDemo(),),
        ListItem(title: 'Chip - 小碎片', page: ChipDemo(),),
        ListItem(title: 'DataTable - 数据表格', page: DataTableDemo(),),
        ListItem(title: 'PaginatedDataTable - 分页显示表格数据', page: PaginatedDataTableDemo(),),
        ListItem(title: 'Card - 卡片', page: CardDemo(),),
        ListItem(title: 'Stepper - 步骤', page: StepperDemo(),),
        ListItem(title: 'StateManagement- 状态管理小部件', page: StateManagementDemo(),),
        ListItem(title: 'Stream - 监听', page: StreamDemo(),),
        ListItem(title: 'Rxdart - 监听', page: RxdartDemo(),),
        ListItem(title: 'Bloc - 监听', page: BlocDemo(),),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page)
        );
      },
    );
  }
}