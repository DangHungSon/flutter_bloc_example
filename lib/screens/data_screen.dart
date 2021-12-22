import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/blocs/data_bloc/data_bloc.dart';
import 'package:flutter_bloc_example/blocs/data_bloc/data_events.dart';
import 'package:flutter_bloc_example/blocs/data_bloc/data_states.dart';
import 'package:flutter_bloc_example/models/data_model.dart';
import 'package:flutter_bloc_example/screens/data_item.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  // List data
  List<DataModel> _data = [];

  // Function call data
  _requestData(bool isError) {
    BlocProvider.of<DataBloc>(context).add(GetDataEvent(isError: isError));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Lang nghe su kien tu bloc
    return BlocConsumer<DataBloc, DataStates>(
        builder: (context, state) => _buildMainUI(context),
        listener: (context, state) {
          if (state is DataStateLoading) {
            // Do something
          } else if (state is DataStateSuccess) {
            // Truyen vao list view
            _data = state.dataList;
          } else if (state is DataStateError) {
            // Show popup loi
            _showError(context, state.message);
          }
        });
  }

  // Build main UI
  Widget _buildMainUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          children: [
            // BUILD TOP BUTTONS
            _buildTopButtons(context),
            // Build list widget
            _buildListView(context)
          ],
        ),
      ),
    );
  }

  // sdkasdj
  Widget _buildTopButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
          onPressed: () {
            // Goi data thanh cong (isError = false)
            _requestData(false);
          },
          child: const Text('Get Data'),
        )),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: ElevatedButton(
          onPressed: () {
            // Goi data khong thanh cong (isError = true)
            _requestData(true);
          },
          child: const Text('Get Data Error'),
        )),
      ],
    );
  }

  // Show popup error
  _showError(BuildContext context, String msg) => showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: Text(msg),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'))
            ],
          ));

  // sadasd
  _buildListView(BuildContext context) {
    return Expanded(
        child: Scrollbar(
      child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            final item = _data[index];
            return DataItem(item: item);
          }),
    ));
  }
}
