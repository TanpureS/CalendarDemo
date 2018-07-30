//
//  ViewController.swift
//  CalenderDemo
//
//  Created by Shivaji Tanpure on 27/07/18.
//  Copyright © 2018 atos. All rights reserved.
//

import UIKit
import FSCalendar

/* Ref:
 //Calendar 3rd Party
 https://github.com/WenchaoD/FSCalendar
 http://cocoadocs.org/docsets/FSCalendar/0.3.0/
 https://stackoverflow.com/questions/tagged/fscalendar
 https://stackoverflow.com/questions/50307950/disabling-past-days-in-fscalendar
 //change starting day
 https://stackoverflow.com/questions/50237292/fscalendar-swift-4-how-to-start-the-week-on-a-particular-date
 https://stackoverflow.com/questions/49856370/how-to-select-range-fscalendar-in-swift
 https://stackoverflow.com/questions/49994859/set-next-previous-button-in-fscalendar
 http://cocoadocs.org/docsets/FSCalendar/0.8.0/
 https://github.com/WenchaoD/FSCalendar/pull/330/commits/88d2aa511cae1e1e2339fd4bd83525f38c69c507
 https://stackoverflow.com/questions/44490389/how-to-make-date-cell-selection-with-square-instead-of-circle-fscalendar-swift-3
 https://jitpack.io/p/WenchaoD/FSCalendar
 //Fetch past booked events
 https://github.com/WenchaoD/FSCalendar/issues/275
 //Add events in FSCalendar
 https://stackoverflow.com/questions/37874349/how-to-add-events-to-fscalendar-swift
 
 */

class ViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate,FSCalendarDelegateAppearance {
   
    
    @IBOutlet weak var calendar: FSCalendar!
    
    //var calendar: FSCalendar!
    
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var presentDatesArray = ["2018-07-03",
    "2018-07-06",
    "2018-07-12",
    "2018-07-25"];
    
    var absentDatesArray = ["2018-07-10",
    "2018-07-18",
    "2018-07-15",
    "2018-07-16"];
    
//    override func loadView() {
//
//        let view = UIView(frame: UIScreen.main.bounds)
//        view.backgroundColor = UIColor.groupTableViewBackground
//        self.view = view
//
//        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 400 : 300
//        let calendar = FSCalendar(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: height))
//        calendar.delegate = self
//        calendar.backgroundColor = UIColor.white
//        self.view.addSubview(calendar)
//        self.calendar = calendar
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FSCalendar"
        //self.calendar.appearance.headerDateFormat = "LLLL yyyy"
        self.calendar.firstWeekday = 2
        
        //calendar.allowsMultipleSelection = true
        //self.calendar.collectionViewLayout.sectionInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        self.calendar.appearance.borderRadius = 0
    }
    
    
    //MARK: FSCalendarDelegate methods
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("did select date \(self.formatter.string(from: date))")
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {

        //let currentMonth = calendar.month(of: calendar.currentPage)
        //print("this is the current Month \(currentMonth)")
        let components = calendar.components.calendar?.dateComponents([.year, .month, .day], from: calendar.currentPage)
        print("this is the current Month \((components?.month)!)")

    }
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        if date .compare(Date()) == .orderedAscending {
            return false
        }
        else {
            return true
        }
    }
    
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        
    
        let dateString: String = self.formatter.string(from: date as Date)
        
        
        if presentDatesArray.contains(dateString)
        {
            return UIColor.green
        }
        else if absentDatesArray.contains(dateString)
        {
            return UIColor.red
        }
        else
        {
            return nil
        }
    }


}

