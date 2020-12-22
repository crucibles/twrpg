// To parse this JSON data, do
//
//     final itemData = itemDataFromMap(jsonString);

import 'dart:convert';

List<ItemData> itemDataFromMap(String str) => List<ItemData>.from(json.decode(str).map((x) => ItemData.fromMap(x)));

String itemDataToMap(List<ItemData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ItemData {
    ItemData({
        this.id,
        this.name,
        this.koreanname,
        this.color,
        this.droprate,
        this.type,
        this.droppedBy,
        this.requiredBy,
        this.description,
        this.stats,
        this.notes,
        this.level,
        this.emoteId,
        this.worth,
        this.recipe,
        this.drops,
    });

    String id;
    String name;
    String koreanname;
    String color;
    dynamic droprate;
    String type;
    List<String> droppedBy;
    List<String> requiredBy;
    String description;
    Stats stats;
    List<String> notes;
    int level;
    String emoteId;
    int worth;
    List<Map<String, int>> recipe;
    List<String> drops;

    factory ItemData.fromMap(Map<String, dynamic> json) => ItemData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
        koreanname: json["koreanname"] == null ? null : json["koreanname"],
        color: json["color"],
        droprate: json["droprate"],
        type: json["type"],
        droppedBy: json["dropped_by"] == null ? null : List<String>.from(json["dropped_by"].map((x) => x)),
        requiredBy: json["required_by"] == null ? null : List<String>.from(json["required_by"].map((x) => x)),
        description: json["description"] == null ? null : json["description"],
        stats: json["stats"] == null ? null : Stats.fromMap(json["stats"]),
        notes: json["notes"] == null ? null : List<String>.from(json["notes"].map((x) => x)),
        level: json["level"] == null ? null : json["level"],
        emoteId: json["emote_id"] == null ? null : json["emote_id"],
        worth: json["worth"] == null ? null : json["worth"],
        recipe: json["recipe"] == null ? null : List<Map<String, int>>.from(json["recipe"].map((x) => Map.from(x).map((k, v) => MapEntry<String, int>(k, v)))),
        drops: json["drops"] == null ? null : List<String>.from(json["drops"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name,
        "koreanname": koreanname == null ? null : koreanname,
        "color": color,
        "droprate": droprate,
        "type": type,
        "dropped_by": droppedBy == null ? null : List<dynamic>.from(droppedBy.map((x) => x)),
        "required_by": requiredBy == null ? null : List<dynamic>.from(requiredBy.map((x) => x)),
        "description": description == null ? null : description,
        "stats": stats == null ? null : stats.toMap(),
        "notes": notes == null ? null : List<dynamic>.from(notes.map((x) => x)),
        "level": level == null ? null : level,
        "emote_id": emoteId == null ? null : emoteId,
        "worth": worth == null ? null : worth,
        "recipe": recipe == null ? null : List<dynamic>.from(recipe.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "drops": drops == null ? null : List<dynamic>.from(drops.map((x) => x)),
    };
}

class Stats {
    Stats({
        this.active,
        this.damage,
        this.allstat,
        this.hpregen,
        this.mpregen,
        this.attackspeedpercent,
        this.expreceivedpercent,
        this.armor,
        this.hp,
        this.skilldamagepercent,
        this.strength,
        this.passive,
        this.agility,
        this.intelligence,
        this.mp,
        this.movespeedpercent,
        this.critchancepercent,
        this.spec,
        this.mdpercent,
        this.drpercent,
        this.affinityiwpercent,
        this.critmultiplier,
        this.dtpercent,
        this.mainstat,
        this.movespeed,
        this.periodicdamagepercent,
        this.healreceivedpercent,
        this.affinityflamepercent,
        this.healingpercent,
        this.revivaltimepercent,
        this.damagedealtpercent,
        this.affinityearthpercent,
        this.affinitywlpercent,
        this.dt,
        this.dodgechancepercent,
    });

    List<String> active;
    int damage;
    int allstat;
    int hpregen;
    double mpregen;
    double attackspeedpercent;
    double expreceivedpercent;
    int armor;
    int hp;
    double skilldamagepercent;
    int strength;
    List<String> passive;
    int agility;
    int intelligence;
    int mp;
    double movespeedpercent;
    double critchancepercent;
    List<String> spec;
    double mdpercent;
    double drpercent;
    double affinityiwpercent;
    double critmultiplier;
    double dtpercent;
    int mainstat;
    int movespeed;
    double periodicdamagepercent;
    double healreceivedpercent;
    double affinityflamepercent;
    double healingpercent;
    double revivaltimepercent;
    double damagedealtpercent;
    double affinityearthpercent;
    double affinitywlpercent;
    int dt;
    double dodgechancepercent;

    factory Stats.fromMap(Map<String, dynamic> json) => Stats(
        active: json["active"] == null ? null : List<String>.from(json["active"].map((x) => x)),
        damage: json["damage"] == null ? null : json["damage"],
        allstat: json["allstat"] == null ? null : json["allstat"],
        hpregen: json["hpregen"] == null ? null : json["hpregen"],
        mpregen: json["mpregen"] == null ? null : json["mpregen"].toDouble(),
        attackspeedpercent: json["attackspeedpercent"] == null ? null : json["attackspeedpercent"].toDouble(),
        expreceivedpercent: json["expreceivedpercent"] == null ? null : json["expreceivedpercent"].toDouble(),
        armor: json["armor"] == null ? null : json["armor"],
        hp: json["hp"] == null ? null : json["hp"],
        skilldamagepercent: json["skilldamagepercent"] == null ? null : json["skilldamagepercent"].toDouble(),
        strength: json["strength"] == null ? null : json["strength"],
        passive: json["passive"] == null ? null : List<String>.from(json["passive"].map((x) => x)),
        agility: json["agility"] == null ? null : json["agility"],
        intelligence: json["intelligence"] == null ? null : json["intelligence"],
        mp: json["mp"] == null ? null : json["mp"],
        movespeedpercent: json["movespeedpercent"] == null ? null : json["movespeedpercent"].toDouble(),
        critchancepercent: json["critchancepercent"] == null ? null : json["critchancepercent"].toDouble(),
        spec: json["spec"] == null ? null : List<String>.from(json["spec"].map((x) => x)),
        mdpercent: json["mdpercent"] == null ? null : json["mdpercent"].toDouble(),
        drpercent: json["drpercent"] == null ? null : json["drpercent"].toDouble(),
        affinityiwpercent: json["affinityiwpercent"] == null ? null : json["affinityiwpercent"].toDouble(),
        critmultiplier: json["critmultiplier"] == null ? null : json["critmultiplier"].toDouble(),
        dtpercent: json["dtpercent"] == null ? null : json["dtpercent"].toDouble(),
        mainstat: json["mainstat"] == null ? null : json["mainstat"],
        movespeed: json["movespeed"] == null ? null : json["movespeed"],
        periodicdamagepercent: json["periodicdamagepercent"] == null ? null : json["periodicdamagepercent"].toDouble(),
        healreceivedpercent: json["healreceivedpercent"] == null ? null : json["healreceivedpercent"].toDouble(),
        affinityflamepercent: json["affinityflamepercent"] == null ? null : json["affinityflamepercent"].toDouble(),
        healingpercent: json["healingpercent"] == null ? null : json["healingpercent"].toDouble(),
        revivaltimepercent: json["revivaltimepercent"] == null ? null : json["revivaltimepercent"].toDouble(),
        damagedealtpercent: json["damagedealtpercent"] == null ? null : json["damagedealtpercent"].toDouble(),
        affinityearthpercent: json["affinityearthpercent"] == null ? null : json["affinityearthpercent"].toDouble(),
        affinitywlpercent: json["affinitywlpercent"] == null ? null : json["affinitywlpercent"].toDouble(),
        dt: json["dt"] == null ? null : json["dt"],
        dodgechancepercent: json["dodgechancepercent"] == null ? null : json["dodgechancepercent"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "active": active == null ? null : List<dynamic>.from(active.map((x) => x)),
        "damage": damage == null ? null : damage,
        "allstat": allstat == null ? null : allstat,
        "hpregen": hpregen == null ? null : hpregen,
        "mpregen": mpregen == null ? null : mpregen,
        "attackspeedpercent": attackspeedpercent == null ? null : attackspeedpercent,
        "expreceivedpercent": expreceivedpercent == null ? null : expreceivedpercent,
        "armor": armor == null ? null : armor,
        "hp": hp == null ? null : hp,
        "skilldamagepercent": skilldamagepercent == null ? null : skilldamagepercent,
        "strength": strength == null ? null : strength,
        "passive": passive == null ? null : List<dynamic>.from(passive.map((x) => x)),
        "agility": agility == null ? null : agility,
        "intelligence": intelligence == null ? null : intelligence,
        "mp": mp == null ? null : mp,
        "movespeedpercent": movespeedpercent == null ? null : movespeedpercent,
        "critchancepercent": critchancepercent == null ? null : critchancepercent,
        "spec": spec == null ? null : List<dynamic>.from(spec.map((x) => x)),
        "mdpercent": mdpercent == null ? null : mdpercent,
        "drpercent": drpercent == null ? null : drpercent,
        "affinityiwpercent": affinityiwpercent == null ? null : affinityiwpercent,
        "critmultiplier": critmultiplier == null ? null : critmultiplier,
        "dtpercent": dtpercent == null ? null : dtpercent,
        "mainstat": mainstat == null ? null : mainstat,
        "movespeed": movespeed == null ? null : movespeed,
        "periodicdamagepercent": periodicdamagepercent == null ? null : periodicdamagepercent,
        "healreceivedpercent": healreceivedpercent == null ? null : healreceivedpercent,
        "affinityflamepercent": affinityflamepercent == null ? null : affinityflamepercent,
        "healingpercent": healingpercent == null ? null : healingpercent,
        "revivaltimepercent": revivaltimepercent == null ? null : revivaltimepercent,
        "damagedealtpercent": damagedealtpercent == null ? null : damagedealtpercent,
        "affinityearthpercent": affinityearthpercent == null ? null : affinityearthpercent,
        "affinitywlpercent": affinitywlpercent == null ? null : affinitywlpercent,
        "dt": dt == null ? null : dt,
        "dodgechancepercent": dodgechancepercent == null ? null : dodgechancepercent,
    };
}
