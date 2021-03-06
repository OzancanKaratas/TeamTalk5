/*
 * Copyright (c) 2005-2018, BearWare.dk
 *
 * Contact Information:
 *
 * Bjoern D. Rasmussen
 * Kirketoften 5
 * DK-8260 Viby J
 * Denmark
 * Email: contact@bearware.dk
 * Phone: +45 20 20 54 59
 * Web: http://www.bearware.dk
 *
 * This source code is part of the TeamTalk SDK owned by
 * BearWare.dk. Use of this file, or its compiled unit, requires a
 * TeamTalk SDK License Key issued by BearWare.dk.
 *
 * The TeamTalk SDK License Agreement along with its Terms and
 * Conditions are outlined in the file License.txt included with the
 * TeamTalk SDK distribution.
 *
 */

import UIKit
import AVFoundation

class SoundEventsViewController : UITableViewController {
    
    var soundevents_items = [UITableViewCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let srvlostcell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let srvlostswitch = newTableCellSwitch(srvlostcell, label: NSLocalizedString("Server Connection Lost", comment: "preferences"), initial: getSoundFile(.srv_LOST) != nil, tag: Sounds.srv_LOST.rawValue)
        srvlostcell.detailTextLabel!.text = NSLocalizedString("Play sound when connection is dropped", comment: "preferences")
        srvlostswitch.addTarget(self, action: #selector(SoundEventsViewController.soundeventChanged(_:)), for: .valueChanged)
        soundeventChanged(srvlostswitch)
        soundevents_items.append(srvlostcell)
        
        let voicetxcell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let voicetxswitch = newTableCellSwitch(voicetxcell, label: NSLocalizedString("Voice Transmission Toggled", comment: "preferences"), initial: getSoundFile(.tx_ON) != nil, tag: Sounds.tx_ON.rawValue)
        voicetxcell.detailTextLabel!.text = NSLocalizedString("Play sound when voice transmission is toggled", comment: "preferences")
        voicetxswitch.addTarget(self, action: #selector(SoundEventsViewController.soundeventChanged(_:)), for: .valueChanged)
        soundeventChanged(voicetxswitch)
        soundevents_items.append(voicetxcell)
        
        let usermsgcell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let usermsgswitch = newTableCellSwitch(usermsgcell, label: NSLocalizedString("Private Text Message", comment: "preferences"), initial: getSoundFile(.user_MSG) != nil, tag: Sounds.user_MSG.rawValue)
        usermsgcell.detailTextLabel!.text = NSLocalizedString("Play sound when private text message is received", comment: "preferences")
        usermsgswitch.addTarget(self, action: #selector(SoundEventsViewController.soundeventChanged(_:)), for: .valueChanged)
        soundeventChanged(usermsgswitch)
        soundevents_items.append(usermsgcell)
        
        let chanmsgcell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let chanmsgswitch = newTableCellSwitch(chanmsgcell, label: NSLocalizedString("Channel Text Message", comment: "preferences"), initial: getSoundFile(.chan_MSG) != nil, tag: Sounds.chan_MSG.rawValue)
        chanmsgcell.detailTextLabel!.text = NSLocalizedString("Play sound when channel text message is received", comment: "preferences")
        chanmsgswitch.addTarget(self, action: #selector(SoundEventsViewController.soundeventChanged(_:)), for: .valueChanged)
        soundeventChanged(chanmsgswitch)
        soundevents_items.append(chanmsgcell)

        let bcastmsgcell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let bcastmsgswitch = newTableCellSwitch(bcastmsgcell, label: NSLocalizedString("Broadcast Text Message", comment: "preferences"), initial: getSoundFile(.broadcast_MSG) != nil, tag: Sounds.broadcast_MSG.rawValue)
        bcastmsgcell.detailTextLabel!.text = NSLocalizedString("Play sound when broadcast text message is received", comment: "preferences")
        bcastmsgswitch.addTarget(self, action: #selector(SoundEventsViewController.soundeventChanged(_:)), for: .valueChanged)
        soundeventChanged(bcastmsgswitch)
        soundevents_items.append(bcastmsgcell)
        
        let loggedincell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let loggedinswitch = newTableCellSwitch(loggedincell, label: NSLocalizedString("User Logged In", comment: "preferences"), initial: getSoundFile(.logged_IN) != nil, tag: Sounds.logged_IN.rawValue)
        loggedincell.detailTextLabel!.text = NSLocalizedString("Play sound when user logs on to the server", comment: "preferences")
        loggedinswitch.addTarget(self, action: #selector(SoundEventsViewController.soundeventChanged(_:)), for: .valueChanged)
        soundeventChanged(loggedinswitch)
        soundevents_items.append(loggedincell)

        let loggedoutcell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let loggedoutswitch = newTableCellSwitch(loggedoutcell, label: NSLocalizedString("User Logged Out", comment: "preferences"), initial: getSoundFile(.logged_OUT) != nil, tag: Sounds.logged_OUT.rawValue)
        loggedoutcell.detailTextLabel!.text = NSLocalizedString("Play sound when user logs off to the server", comment: "preferences")
        loggedoutswitch.addTarget(self, action: #selector(SoundEventsViewController.soundeventChanged(_:)), for: .valueChanged)
        soundeventChanged(loggedoutswitch)
        soundevents_items.append(loggedoutcell)

        let joinedchancell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let joinedchanswitch = newTableCellSwitch(joinedchancell, label: NSLocalizedString("User Joins Channel", comment: "preferences"), initial: getSoundFile(.joined_CHAN) != nil, tag: Sounds.joined_CHAN.rawValue)
        joinedchancell.detailTextLabel!.text = NSLocalizedString("Play sound when a user joins the channel", comment: "preferences")
        joinedchanswitch.addTarget(self, action: #selector(SoundEventsViewController.soundeventChanged(_:)), for: .valueChanged)
        soundeventChanged(joinedchanswitch)
        soundevents_items.append(joinedchancell)
        
        let leftchancell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let leftchanswitch = newTableCellSwitch(leftchancell, label: NSLocalizedString("User Leaves Channel", comment: "preferences"), initial: getSoundFile(.left_CHAN) != nil, tag: Sounds.left_CHAN.rawValue)
        leftchancell.detailTextLabel!.text = NSLocalizedString("Play sound when a user leaves the channel", comment: "preferences")
        leftchanswitch.addTarget(self, action: #selector(SoundEventsViewController.soundeventChanged(_:)), for: .valueChanged)
        soundeventChanged(leftchanswitch)
        soundevents_items.append(leftchancell)
        
        let voxtriggercell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let voxtriggerswitch = newTableCellSwitch(voxtriggercell, label: NSLocalizedString("Voice Activation Triggered", comment: "preferences"), initial: getSoundFile(.voxtriggered_ON) != nil, tag: Sounds.voxtriggered_ON.rawValue)
        voxtriggercell.detailTextLabel!.text = NSLocalizedString("Play sound when voice activation is triggered", comment: "preferences")
        voxtriggerswitch.addTarget(self, action: #selector(SoundEventsViewController.soundeventChanged(_:)), for: .valueChanged)
        soundeventChanged(voxtriggerswitch)
        soundevents_items.append(voxtriggercell)
        
        let transmitcell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let transmitswitch = newTableCellSwitch(transmitcell, label: NSLocalizedString("Exclusive Mode Toggled", comment: "preferences"), initial: getSoundFile(.transmit_ON) != nil, tag: Sounds.transmit_ON.rawValue)
        transmitcell.detailTextLabel!.text = NSLocalizedString("Play sound when transmit ready in \"No Interruptions\" channel", comment: "preferences")
        transmitswitch.addTarget(self, action: #selector(SoundEventsViewController.soundeventChanged(_:)), for: .valueChanged)
        soundeventChanged(transmitswitch)
        soundevents_items.append(transmitcell)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("Sound Events", comment:"text to speech")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soundevents_items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return soundevents_items[indexPath.row]
    }
    
    @objc func soundeventChanged(_ sender: UISwitch) {
        
        let defaults = UserDefaults.standard
        
        let sound = Sounds(rawValue: sender.tag)!
        switch sound {
        case Sounds.tx_ON :
            defaults.set(sender.isOn, forKey: PREF_SNDEVENT_VOICETX)
        case Sounds.srv_LOST :
            defaults.set(sender.isOn, forKey: PREF_SNDEVENT_SERVERLOST)
        case Sounds.chan_MSG :
            defaults.set(sender.isOn, forKey: PREF_SNDEVENT_CHANMSG)
        case Sounds.broadcast_MSG :
            defaults.set(sender.isOn, forKey: PREF_SNDEVENT_BCASTMSG)
        case Sounds.joined_CHAN :
            defaults.set(sender.isOn, forKey: PREF_SNDEVENT_JOINEDCHAN)
        case Sounds.left_CHAN :
            defaults.set(sender.isOn, forKey: PREF_SNDEVENT_LEFTCHAN)
        case Sounds.user_MSG :
            defaults.set(sender.isOn, forKey: PREF_SNDEVENT_USERMSG)
        case Sounds.voxtriggered_ON :
            defaults.set(sender.isOn, forKey: PREF_SNDEVENT_VOXTRIGGER)
        case Sounds.transmit_ON :
            defaults.set(sender.isOn, forKey: PREF_SNDEVENT_TRANSMITREADY)
        case Sounds.logged_IN :
            defaults.set(sender.isOn, forKey: PREF_SNDEVENT_LOGGEDIN)
        case Sounds.logged_OUT :
            defaults.set(sender.isOn, forKey: PREF_SNDEVENT_LOGGEDOUT)
        default :
            break
        }
        
        if sender.isOn {
            playSound(sound)
        }
    }
}
