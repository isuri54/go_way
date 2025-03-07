import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String from;
  final String to;
  final String total;

  const ConfirmationDialog({
    required this.from,
    required this.to,
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Confirmation",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          _buildDetailRow("From                     Homagama", from),
          const SizedBox(height: 10),
          _buildDetailRow("To                          NSBM", to),
          const SizedBox(height: 10),
          _buildDetailRow("Total", total, isTotal: true),
        ],
      ),
      actions: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[700],
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: () {
              void _showModalBottomSheet(context) {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 700,
                      child: Column(
                        children: [
                          ListTile(
                            title: Icon(
                              Icons.warning,
                              size: 75,
                              color: Colors.red,
                            ),
                          ),
                          ListTile(
                            title: Center(
                              child: Text(
                                "Warning!!!",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Center(
                              child: Text(
                                "By submitting this complaint, the following details will be shared with the police department.",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Center(
                              child: Text(
                                "Note: Proving false or misleading information is a punishable offense under the law",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox( height: 10,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },

                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellow
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 50,),
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: ElevatedButton(
                                  onPressed: (){
                                  },

                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellow
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      "Proceed",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              } // Confirm and close the dialog
            },
            child: const Text(
              "Confirm",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Align text to the left
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(), // This will push the value to the right
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 22 : 18,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.green[700] : Colors.black,
          ),
        ),
      ],
    );
  }
}
