package fr.bermosa.web;
import fr.bermosa.domain.Groupe;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/groupes")
@Controller
@RooWebScaffold(path = "groupes", formBackingObject = Groupe.class)
public class GroupeController {
}
