def calc_odds(back_odds, back_stake, lay_odds)

    lay_stake = 0.01
    cont = true
    
    while cont do
        bw = back_wins(back_odds, back_stake, lay_stake, lay_odds)
        lw = lay_wins(back_stake, lay_stake)
        
        if bw > lw 
            lay_stake = lay_stake + 0.01
        else
            cont = false
        end
    end

    lay_stake.round(2)
end

def back_wins(back_odds, back_stake, lay_stake, lay_odds)
    
    back_win = back_odds * back_stake
    
    if back_win - back_stake < back_stake
        com = back_win * 0.01 
    else
        com = back_stake * 0.01
    end
    
    back_profit = back_win - back_stake
    
    (back_profit - ((lay_stake * lay_odds) - lay_stake) - com).round(2)  
end

def lay_wins(back_stake, lay_stake)
    (lay_stake - back_stake - (lay_stake * 0.01)).round(2)
end

puts calc_odds(2.05, 100, 2.08 )