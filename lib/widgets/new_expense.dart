import 'package:flutter/material.dart';
import 'package:travel_expenses/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _chosenDate;
  Category _chosenCategory = Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 2, now.month, now.day);
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _chosenDate = selectedDate;
    });
  }

  void _submitExpense(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount<=0;
    if(_titleController.text.trim().isEmpty || amountIsInvalid || _chosenDate ==null){
      showDialog(context: context, builder: (dialogContext)=>
      AlertDialog(
        title: const Text('Invalid Input'),
        content: const Text('Please ensure you have entered a Title, Amount, Date, and Category'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(dialogContext);
          }, 
          child: const Text('Okay'))
        ],
      ));
      return;
    }
    widget.onAddExpense(Expense(
      title: _titleController.text,
      amount: enteredAmount,
      date: _chosenDate!,
      category: _chosenCategory,
    ));
    Navigator.pop(context); //1. added this to close the modal after adding the expense
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 45,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_chosenDate == null
                      ? 'Select Date'
                      : formatter.format(_chosenDate!)), //If you print the chosenDate without the format, it actually works, unsure why it wasn't showing up when we tried during the recording
                  IconButton(
                      onPressed: _openDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Text("Expense Category"),
              const SizedBox(
                width: 30,
              ),
              DropdownButton(
                  value: _chosenCategory,
                  items: Category.values.map
                  ((category) => 
                    DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase()))).toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _chosenCategory = value;
                    });
                  }),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: _submitExpense,
                child: const Text('Save Expense'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
