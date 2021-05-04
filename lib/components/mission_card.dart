import 'package:devpush/components/progress_bar.dart';
import 'package:flutter/material.dart';

import 'package:devpush/core/app_colors.dart';
import 'package:devpush/core/app_text_styles.dart';
import 'package:devpush/models/mission_model.dart';
import 'package:google_fonts/google_fonts.dart';

class MissionCard extends StatefulWidget {
  final MissionModel mission;
  final Color color;
  final int currentProgress;
  final VoidCallback onTap;
  final Icon icon;
  const MissionCard({
    Key key,
    @required this.mission,
    @required this.color,
    @required this.currentProgress,
    @required this.onTap,
    @required this.icon,
  }) : super(key: key);

  @override
  _MissionCardState createState() => _MissionCardState();
}

class _MissionCardState extends State<MissionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.light,
            ),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.color,
                  ),
                  child: widget.icon,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Nível ${widget.mission.level}',
                  style: GoogleFonts.nunito(
                    color: widget.color,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sábio',
                    style: AppTextStyles.subHead,
                  ),
                  widget.mission.reward > 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 36,
                            width: double.maxFinite,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(widget.color),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                // side: MaterialStateProperty.all(BorderSide(color: borderColor)),
                              ),
                              onPressed: widget.onTap,
                              child: Text(
                                'Receber',
                                style: AppTextStyles.buttonText,
                              ),
                            ),
                          ),
                        )
                      : widget.mission.isCompleted
                          ? Row(
                              children: [
                                Text(
                                  'Completado',
                                  style: AppTextStyles.description12,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.check,
                                  size: 16,
                                  color: widget.color,
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Alcance o level ${widget.mission.currentGoal}.',
                                  style: AppTextStyles.description12,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Stack(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 1,
                                        ),
                                        ProgressBar(
                                          value: widget.currentProgress /
                                              widget.mission.currentGoal,
                                          color: widget.color,
                                          height: 14,
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: Text(
                                        '${widget.currentProgress}/${widget.mission.currentGoal}',
                                        style: AppTextStyles.whiteText,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}