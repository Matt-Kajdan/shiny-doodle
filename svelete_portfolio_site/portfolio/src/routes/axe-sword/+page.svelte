<script>
    import Project from "../../lib/components/Project.svelte";

    const title = "Axe & Sword"

    const descriptionMap = {
    0: "Restaurant",
    1: "",
    2: "",
    3: "",
    4: "",
    };
    
    const images = [
        "./work/axe-sword/card.png"
]

</script>

<Project 
    title={title}
    descriptionMap={descriptionMap}
    images={images}
/>
